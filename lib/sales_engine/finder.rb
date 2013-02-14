module SalesEngine
  module Finder

    def random
      all.sample
    end

    def find_by_id(id)
      all.find { |item| item.id == id }
    end

  end
end
