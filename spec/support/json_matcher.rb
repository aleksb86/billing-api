RSpec::Matchers.define :match_json_schema do |schema|
  match do |response|
    JSON::Validator.validate!(
      "#{Dir.pwd}/spec/support/schemas/#{schema}.json",
      response.body,
      strict: true
    )
  end
end
