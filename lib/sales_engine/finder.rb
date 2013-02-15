module SalesEngine
  module Finder

    def random
      all.sample
    end

    def find_by_id(id)
      all.find { |item| item.id == id }
    end

    def find_by_(attr, value)
      #all.find { |item| item.send(attr).downcase == value.downcase }
      find_all_by_(attr, value).first
    end

    def find_all_by_(attr, value)
      all.select { |item| item.send(attr).downcase == value.downcase }
    end

  end
end
