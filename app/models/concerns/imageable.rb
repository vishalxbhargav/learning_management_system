module Imageable
  extend ActiveSupport::Concern
  included do
    has_one :picture, as: :imageable
  end
end
