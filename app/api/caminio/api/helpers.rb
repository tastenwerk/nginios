module Caminio
  module API
    module Helpers

      include ActionView::Helpers::AssetUrlHelper

      def logger
        Grape::API.logger
      end

      def authenticate!
        error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end

      def current_token
        token = params.access_token
        token = headers['Authorization'].split(' ').last unless token
        return unless api_key = ApiKey.where(access_token: token).gt(expires_at: Time.now).first
        api_key.access_token
      end

      def token_authenticate!
        access = Doorkeeper::AccessToken.authenticate(headers['Authorization'])
        return false unless access && access.valid?
        @user = User.find(access.resource_owner_id)
        @application = access.application.name
      end

      def current_user
        token = params.access_token
        token = headers['Authorization'].split(' ').last if !token && headers.has_key?('Authorization')
        return false unless token
        if api_key = ApiKey.where(access_token: token).gt(expires_at: Time.now).first
          api_key.update! expires_at: 1.hour.from_now if api_key.expires_at < 1.hour.from_now
          I18n.locale = api_key.user.locale || I18n.locale
          RequestStore.store[:current_user] = api_key.user
          RequestStore.store[:current_ou_id] = params.ou || headers['Ou']
          return @current_user = api_key.user
        end
        false
      end

      def current_organizational_unit
        ou = params.ou
        ou = headers['Ou'] if !ou && headers.has_key?('Ou')
        return nil unless ou
        ou = OrganizationalUnit.find(ou)
        return unless current_user.organizational_units.include?(ou)
        RequestStore.store[:current_ou] = ou
        return ou
      end

      def host_url
        # "#{request.prototol}#{request.host_with_port}"
        protocol = "http#{"s" if request.scheme == 'https'}://"
        protocol+request.host_with_port
        # request.env['HTTP_REFERER']
      end

      def logo_url
        "#{host_url}#{asset_path('logo_128x128.png')}"
      end

    end

  end
end
