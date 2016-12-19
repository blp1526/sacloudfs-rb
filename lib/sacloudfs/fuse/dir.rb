module Sacloudfs
  module Fuse
    class Dir < FuseFS::FuseDir
      def contents(path)
        items = scan_path(path)
        return [] unless valid_items?(items)
        case items.size
        when 0
          zones
        when 1
          resources
        when 2
          ids(zone: items[0], resource: items[1])
        end
      end

      def file?(path)
        last_item = scan_path(path).last
        last_item =~ /\A\d{12}\z/
      end

      def read_file(path)
        "Sorry, unimplemented.\n" if path
      end

      def directory?(path)
        last_item = scan_path(path).last
        zones.include?(last_item) || resources.include?(last_item)
      end

      private

        def zones
          %w(is1a is1b tk1a)
        end

        def resources
          %w(server disk archive)
        end

        def ids(zone:, resource:)
          api = ::Sacloudfs::Api.new(zone)
          api.get(resource)[resource.pluralize.capitalize].map { |item| item['ID'] }
        end

        def valid_items?(items)
          return true if items.size.zero?
          return true if items.size == 1 && zones.include?(items[0])
          return true if items.size == 2 && zones.include?(items[0]) && resources.include?(items[1])
          false
        end
    end
  end
end
