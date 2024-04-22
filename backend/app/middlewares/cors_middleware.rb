class CorsMiddleware
    def initialize(app)
      @app = app
    end
  
    def call(env)
      status, headers, response = @app.call(env)
      
      headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      headers['Access-Control-Allow-Credentials'] = 'true'
      
      [status, headers, response]
    end
  end
  