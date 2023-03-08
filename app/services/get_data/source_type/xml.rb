module GetData
  module SourceType
    class Xml < Nokogiri::XML::SAX::Document
      def start_document
      end

      def start_element(name, attrs = [])
        attrs = attrs.to_h

        case name
        when 'offer'
          return if Product.find_by(offer_id: attrs['id'])

          @product = Product.create(offer_id: attrs['id'])
        when 'url'
        when 'param'
        end

      end

      def end_element(name) end

      def end_document
      end
    end
  end
end