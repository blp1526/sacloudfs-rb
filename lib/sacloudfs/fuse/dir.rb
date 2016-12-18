module Sacloudfs
  module Fuse
    class Dir < FuseFS::FuseDir
      def contents(path)
        ['hello.txt']
      end

      def file?(path)
        path == '/hello.txt'
      end

      def read_file(path)
        "Hello, World!\n"
      end
    end
  end
end
