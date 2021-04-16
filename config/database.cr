database_name = "smash_up_#{Lucky::Env.name}"

AppDatabase.configure do |settings|
  settings.credentials = Avram::Credentials.void
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase
end
