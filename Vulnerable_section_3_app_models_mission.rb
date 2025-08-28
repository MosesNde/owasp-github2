   validates_uniqueness_of :title, case_sensitive: true
 
   scope :title_like, ->(title) { where('title LIKE ?', "%#{title}%") if title }
  scope :status, ->(status) { where({ status: status }) if status.present? && Mission.statuses.keys.include?(status) }
 end