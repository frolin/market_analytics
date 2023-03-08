require "down/http"

class FileUploader < Shrine
  plugin :remote_url, max_size: nil, downloader: -> (url, **options) {
    Down::Http.download(url, **options) do |client|
      client.follow(max_hops: 2).timeout(connect: 2, read: 2)
    end
  }
end
