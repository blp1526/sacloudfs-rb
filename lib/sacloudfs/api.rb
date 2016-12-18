module Sacloudfs
  class Api
    # NOTE: See http://developer.sakura.ad.jp/cloud/api/1.1/
    attr_reader :zone, :api_version, :access_token, :access_token_secret

    def initialize(zone)
      @zone                = zone
      sacloudfs_yml        = YAML.load_file(File.join(Dir.home, 'sacloudfs.yml'))
      apikey_user          = sacloudfs_yml[ENV['APIKEY_USER']]
      @api_version         = apikey_user.api_version
      @access_token        = apikey_user.access_token
      @access_token_secret = apikey_user.oaccess_token_secret
    end

    def domain
      'https://secure.sakura.ad.jp'
    end

    def base_path
      "/cloud/zone/#{zone}/api/cloud/#{api_version}"
    end

    def endpoint_path(resource)
      File.join(base_path, resource)
    end

    def conn
      Faraday.new(domain) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def get(resource, params = nil)
      response = conn.get(endpoint_path(resource)) do |req|
        req.params = params if params
      end
      parsed_response_body(response)
    end

    private

      def parsed_response_body(response)
        raise '404NotFoundError' if response.status == 404
        JSON.parse(response.body)
      end
  end
end
