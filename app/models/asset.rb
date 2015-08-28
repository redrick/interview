class Asset < ActiveRecord::Base
	belongs_to :task

	has_attached_file :attachment,
    url: '/assets/files/:id/:basename.:extension',
    path: ':rails_root/public/assets/files/:id/:basename.:extension'

  # this is not the best idea 
  # I did it to be able to attach
  # txt, pdf files
  do_not_validate_attachment_file_type :attachment

  validates_attachment_size :attachment, :in => 0..1.megabyte
end
