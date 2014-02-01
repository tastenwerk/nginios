Whilst the models are currently not much more than wrapper functions for usual mongoose models, the controller logic has it's own implementation in caminio.

## Model

The easiest and fastest way to see what caminio can do for you, is by start creating a model. There is the caminio-cli script again, which provides a shortcut:

    $ caminio model Post

This will create `app/models/my_model.js`

{% highlight javascript %}

    module.exports = function Post( caminio, mongoose ){

      var schema = new mongoose.Schema({
        name: String,
        content: String,
        created: { 
          at: { type: Date, default: Date.now },
          by: { type: ObjectId, ref: 'User' }
        },
        updated: { 
          at: { type: Date, default: Date.now },
          by: { type: ObjectId, ref: 'User' }
        }
      });

      schema.publicAttributes = ['name','updated','created'];

      return schema;

    }

{% endhighlight %}

You can find a quite well elaborated documentation about mongoose at their [website](http://mongoosejs.com). If you are new to mongo or mongoose, they have a good [starting guide](http://mongoosejs.com/docs/guide.html).

### Starting the magic

This is, why caminio is a very fine rapid prototyping eco-system: The only setting to get a fully automated JSON-API interface is set up in `config/routes.js`

{% highlight javascript %}

  module.exports.routes = {

    // ...

    'autorest /posts': 'Post'

    // ...

  };

{% endhighlight %}

If your server isn't running, start it up with `npm start`.

The Gruntfile will take control and start caminio in `watch` mode. Any changes will be recognized and cause the server to reload immediately. The default port of caminio is `4000`. Fire up your favorite browser and visit `http://localhost:4000`.

I recommend the RESTClient addon for Firefox or Postman for Google Chrome to test the API. You can - of course also just use curl as I do below:

## Autorest

receive posts:

    $ curl http://localhost:4000/posts
    []

create a new post:

    $ curl -X POST --data "post[name]=John\ Doe" http://localhost:4000/posts
    {
      "name": "John Doe",
      [...],
      "id": "52s826624e84320aaby01337"
    }

retrieve a single post by its id:

    $ curl http://localhost:4000/posts/52s826624e84320aaby01337
    {
      "name": "Joh",
      [...],
      "id": "52s826624e84320aaby01337"
    }

update a post:

    $ curl -X PUT --data "post[name]=changed" http://localhost:4000/posts/52s826624e84320aaby01337
    {
      "name": "changed",
      [...],
      "id": "52s826624e84320aaby01337"
    }

find posts with name like 'Joh':

    $ curl http://localhost:4000/posts/find\?name\=regexp\(/Joh/i\)

Here, RESTClient or Postman are a bit more handsome.


## Controller

Similar to the model, caminio-cli provides a template generator:

    $ caminio controller PostsController

This creates `app/controllers/posts_controller.js` and an index file in `app/views/posts/index.html.jade`. Note, that in caminio, your jade files should wear the .html.jade extension. That way, you can have different types of views, like `.xml.jade`, `.csv.jade` and so on.
