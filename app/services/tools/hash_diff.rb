module Tools
  class HashDiff

    def self.call(hash1, hash2)
      byebug
      diff_data = Hash[*(hash1.to_a - hash2.to_a).flatten]

      diff_data.map do |key, value|
        { key => [hash2[key], diff_data[key]] }
      end.flatten
    end

  end
end