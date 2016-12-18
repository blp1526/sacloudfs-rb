module Sacloudfs
  class Api
    # NOTE: See http://developer.sakura.ad.jp/cloud/api/1.1/
    attr_reader :zone_name, :api_version

    def initialize(zone_name:, api_version:)
      @zone_name = zone_name
      @api_version = api_version
    end

    def domain
      'https://secure.sakura.ad.jp'
    end

    def base_path
      "/cloud/zone/#{zone_name}/api/cloud/#{api_version}"
    end

    def endpoint_path(resource)
      File.join(base_path, resource)
    end

    def get
      raise 'Sorry, unimplemented'
    end

    def post
      raise 'Sorry, unimplemented'
    end

    def put
      raise 'Sorry, unimplemented'
    end

    def delete
      raise 'Sorry, unimplemented'
    end
  end
end