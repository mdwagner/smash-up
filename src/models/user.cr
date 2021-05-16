struct User
  include JSON::Serializable

  @[JSON::Field(key: "sub")]
  getter id : String

  @[JSON::Field(key: "preferred_username")]
  getter username : String

  @[JSON::Field(key: "applicationId")]
  getter app_id : String

  getter roles : Array(String)

  # same as client_id
  @[JSON::Field(key: "aud")]
  getter audience : String

  @[JSON::Field(key: "iss")]
  getter issuer : String

  # should only be PASSWORD for now
  @[JSON::Field(key: "authenticationType")]
  getter auth_type : String

  @[JSON::Field(key: "iat")]
  getter issued_at : Int64

  @[JSON::Field(key: "exp")]
  getter expired_at : Int64

  @[JSON::Field(key: "jti")]
  getter jwt_id : String

  getter email : String?
  getter email_verified : Bool?
end
