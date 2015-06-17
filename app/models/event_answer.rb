class EventAnswer < ActiveRecord::Base
  include ActionView::Context
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  belongs_to :event_part

  validates :name, :answer, :next_type, :next_id, presence: true

  def to_link(html_options = {})
    link_to(send("render_#{next_type}_path", "#{next_type}_id": next_id), html_options) do
      yield
    end.html_safe
  end
end
