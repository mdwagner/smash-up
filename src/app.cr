require "./shards"

# Load the asset manifest in public/mix-manifest.json
Lucky::AssetHelpers.load_manifest

require "./app_database"
require "./operations/mixins/**"
require "./operations/**"
require "./serializers/base_serializer"
require "./serializers/**"
require "./actions/mixins/**"
require "./actions/**"
require "./components/base_component"
require "./components/**"
require "./pages/**"
require "../config/env"
require "../config/**"
require "./app_server"
