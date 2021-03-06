module SalesEngine
  module Finder

    def random
      all.sample
    end

    def find_by_id(id)
      all.find { |item| item.id == id }
    end

    def find_by_(attr, value)
      find_all_by_(attr, value).first
    end

    def find_all_by_(attr, value)
      all.select { |item| item.send(attr).to_s.downcase == value.to_s.downcase }
    end

  end
end
