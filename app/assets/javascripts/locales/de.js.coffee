Em.I18n.availableTranslations ||= {}
Em.I18n.availableTranslations.de ||= {}

Em.merge Em.I18n.availableTranslations.de,
  alias: 'Alias'
  or: 'oder'
  year: 'Jahr'
  month: 'Monat'
  username_or_email: 'Benutzername oder Email'
  firstname: 'Vorname'
  lastname: 'Nachname'
  password: 'Passwort'
  login: 'Anmelden'
  logout: 'Abmelden'
  aborted: 'Abgebrochen'
  no_account_yet: 'Noch kein Konto?'
  back_to_login: 'Zurück zum Login'
  signup: 'Kostenlos Registrieren'
  confirmation_code: 'Bestätigungs-Code'
  confirmation_code_has_been_sent: 'Ein Bestätigungs-Code wurde an die angegebene Email-Adresse versandt. Bitte prüfe deinen Posteingang und gib den in der Email angeführten 4-stelligen Code hier ein'
  forgot_your_password: 'Passwort vergessen?'
  send_link: 'Email senden'
  reset_password: 'Passwort zurücksetzen'
  reset_password_desc: 'Du kannst jetzt ein neues Passwort wählen. Bitte beachte die Kriterien (mind. 1 Großbuchstabe, mind. 1 Kleinbuchstabe, mind. 1 Ziffer)'
  forgot_password_desc: 'Du hast dein Passwort vergessen? Wir wissen es auch nicht. Es liegt verschlüsselt auf unserem Server gespeichert. Gib deine Email Adresse an, und wir senden dir einen Link zu, mit dem du dein Passwort neu setzen kannst.'
  link_sent: 'Ein Link wurde an {{email}} versandt. Bitte prüfe deinen Posteingang und klick auf den in der Email enthaltenen Link'
  continue: 'Weiter'
  register: 'Registrieren'
  username: 'Alias'
  private: 'Privat'
  color: 'Farbe'
  agree_policies: 'Ich bin mit den Allgemeinen Geschäftsbedingungen einverstanden'
  search_app: 'Anwendung suchen'
  search_dots: 'Suche ...'
  select_language: 'Sprache wählen'
  apps: 'Applikationen'
  dashboard:
    title: 'Dashboard'
    activity: 'Aktivitäten'
  administration: 'Administration'
  
  save: 'Speichern'
  cancel: 'Abbrechen'
  saved: '{{name}} wurde gespeichert'

  cancel_edit_entry: 'Bearbeiten abbrechen'
  edit_entry: 'Eintrag bearbeiten'
  entry_saved: 'Eintrag gespeichert'
  search_for: 'Suche nach...'

  superuser_actions: 'Superuser Aktionen'

  no_matches_found: 'Keine Ergebnisse gefunden'

  new: 'Neu'
  settings_saved: 'Einstellungen gespeichert'
  name: 'Name'
  created_at: 'Erstellt am'
  email: 'Email'
  phone: 'Mobiltelefon'
  current_organization: 'Aktuelle Organisation'

  users:
    title: 'Benutzerkonten'
    pl_title: 
      one: 'Benutzerkonto'
      other: 'Benutzerkonten'
    online: 'Benutzer online'
    quota: 'Quota'
    allowed: 'Max. Benutzer (Quota)'
    new_0: 'Neuer'
    new_1: 'Benutzer'

  roles:
    admin: 'Administrator'
    editor: 'Redakteur'
    user: 'Standard'

  user:
    role: 'Rolle'
    search: 'Benutzer suchen'
    role_changed: 'Benutzerkonto <tt>{{name}}</tt> ist jetzt <strong>{{role}}</strong>'
    locale_changed: 'Sprache für das Benutzerkonto wurde auf <strog>{{locale}}</strong> gesetzt'
    language: 'Sprache'
    general: 'Allgemein'
    edit: 'Benutzerkonto bearbeiten'
    select_role: 'Rolle wählen'
    suspended: 'Suspendiert'
    activity_status: 'Aktivitätsstatus'
    active: 'Aktiv'
    really_suspend: 'Möchtest du dieses Benutzerkonto wirklich suspenieren?'
    has_been_suspended: 'Das Benutzerkonto wurde suspendiert. Login ist nicht mehr möglich'
    back_active: 'Das Benutzerkonto ist jetzt aktiv und kann wieder verwendet werden'
    really_delete: 'Um das Benutzerkonto <tt>{{email}}</tt> <strong>unwiderruflich</strong> zu löschen, gib bitte noch einmal die Email Adresse zur Bestätigung ein'
    has_been_deleted: 'Das Benutzerkonto <strong>{{name}}</strong> wurde gelöscht'
    unsubscribe_from_group: 'Aus Gruppe entfernen'
    delete: 'Löschen'
    delete_permanently: 'Permanent löschen'

  groups:
    manage: 'Gruppen verwalten'
    title: 'Gruppen'
    pl_title: 
      one: 'Gruppe'
      other: 'Gruppen'
    largest: 'Größte Gruppe'
    new_0: 'Neue'
    new_1: 'Gruppe'

  group:
    create_new: 'Neue Gruppe erstellen'
    member_added: '{{email}} ist jetzt Mitglied in der Gruppe {{name}}'
    member_removed: '{{email}} ist jetzt kein Mitglied der Gruppe {{name}} mehr'
    name: 'Name der Gruppe'
    edit: 'Gruppe bearbeiten'
    edit_members: 'Mitglieder bearbeiten'
    general: 'Allgemein'
    members: 'Mitglieder'
    members_of: 'Mitglieder von <strong>{{name}}</strong>'
    really_delete: 'Gruppe <tt>{{name}}</tt> wirklich löschen?'
    delete: 'Gruppe löschen'
    deleted: 'Gruppe <strong>{{name}}</strong> wurde gelöscht'
    add_user: 'Benutzer zur Gruppe hinzufügen'
    add_member: 'Mitglied hinzufügen'
    num_members:
      one: 'Ein Mitglied'
      other: '{{count}} Mitglieder'

  organizations:
    further: '{{count}} weitere Organisationen'
    show_all: 'Alle Organisationen anzeigen'

  organization:
    title: 'Organisation'
    edit: 'Organisation bearbeiten'
    name: 'Name der Organisation'
    create_new: 'Neue Organisation erstellen'
    new_0: 'Neue'
    new_1: 'Organisation'
    general: 'Allgemein'
    fqdn: 'Domäne (FQDN)'

  account:
    settings: 'Einstellungen (Experten)'
    mine: 'Mein Konto'
    manage: 'Konten verwalten'
    personal: 'Angaben zur Person'
    security: 'Sicherheit'
    contact_info: 'Kontaktinformationen'
    enter_current_password: 'Zur Bestätigung gib bitte dein aktuelles Passwort an'
    wrong_password: 'Das angegebene Passwort ist falsch'
    general: 'Allgemein'
    privacy: 'Privatsphäre'
    groups: 'Gruppen'
    create_account: 'Konto erstellen'
    edit: 'Konto bearbeiten'
    edit_mine: 'Mein Konto bearbeiten'
    suspend_login: 'Suspendieren (Login verbieten)'
    admin:
      users: 'Konten verwalten'
      organizations: 'Organisationen'

  subscriptions:
    title: 'Abonnements'
    really_switch_to_plan: 'Möchten Sie wirklich auf den Plan <tt>{{title}}</tt> wechseln? Bestätigen Sie den Wechsel bitte mit Ihrem Password'
    switched_to_plan: 'Sie haben nun in den Plan <tt>{{title}}</tt> gewechselt'

  errors:
    login_failed: 'Anmeldung fehlgeschlagen!'
    email_required: 'Email Adresse erforderlich'
    email_exists: 'Die Email Adresse {{email}} ist schon registriert'
    email_unknown: 'Die Email Adresse {{email}} ist uns nicht bekannt'
    organization_exists: 'Diese Organisation ist bereits registriert'
    organization_name_required: 'Organisationsname muss vergeben werden'
    group_name_required: 'Gruppenname muss vergeben werden'
    not_an_email_address: 'Die angegebene Email Adresse ist ungültig'
    organization_required: 'Wenn du dich als Organisation registrieren möchtest, musst du auch einen Organisationsnamen angeben. Ansonsten wähle "Privat"'
    password_required: 'Bitte wähle ein Passwort'
    password_policies_not_fulfilled: 'Das Passwort entspricht nicht den Kritierien:<br><ul><li>mindestens 6 Zeichen lang</li><li>Enthält mindestens einen Großbuchstaben</li><li>Enthält midnestens einen Kleinbuchstaben</li><li>Enthält mindestens eine Zahl oder ein Sonderzeichen</li></ul>'
    accept_terms: 'Du musst unsere Geschäftsbedingungen akzeptieren, um fortzufahren'
    invalid_code: 'Der angegebene Code ist falsch'
    key_invalid_or_expired: 'Der Schlüssel ist falsch oder abgelaufen. Bitte wiederhole den Vorgang'
    code_required: 'Bitte gib den Code ein, der dir in der Email zugesandt wurde'
    unkown: 'Unbekannter Fehler! Bitte kontaktiere den Support'
    cannot_suspend_yourself: 'Du kannst dich nicht selbst suspendieren'
    cannot_delete_until_new_admin: 'Du kannst dein Konto nicht löschen, bevor nicht ein neuer Administrator bestimmt wurde'
    please_remove_yourself_in_your_account_settings: 'Bitte lösche dein eigenes Konto ausschließlich in deinen Kontoeinstellungen'
