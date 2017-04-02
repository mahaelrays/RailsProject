class Order < ApplicationRecord
  belongs_to :user
  # has_attached_file :menu,
  #                   styles: { medium: "300x300>", thumb: "100x100>" },
  #                  default_url: "/images/1.png"
  # Validate content type
  # validates_attachment_content_type :menu, content_type: /\Aimage\/.*\z/
  # Validate filename
  # validates_attachment_file_name :menu, matches: [/png\z/, /jpe?g\z/]
  # Explicitly do not validate
  # do_not_validate_attachment_file_type :menu
  dragonfly_accessor :menu
end
