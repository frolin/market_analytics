require "down/http"
require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :derivatives

  plugin :remote_url, max_size: nil, downloader: -> (url, **options) {
    Down::Http.download(url, **options) do |client|
      client.follow(max_hops: 2).timeout(connect: 2, read: 2)
    end
  }

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      large: magick.resize_to_limit!(800, 800),
      medium: magick.resize_to_limit!(500, 500),
      small: magick.resize_to_limit!(300, 300),
    }
  end
end
