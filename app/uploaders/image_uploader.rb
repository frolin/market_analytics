 require "down/http"
class ImageUploader < Shrine
plugin :determine_mime_type

plugin :remote_url, max_size: nil, downloader: -> (url, **options) {
  Down::Http.download(url, **options) do |client|
    client.follow(max_hops: 2).timeout(connect: 2, read: 2)
  end
}
end