def hello(event:, context:)
  { statusCode: 200, body: JSON.generate('Hello from Ruby!') }
end
