class SleepSession < ActiveRecord::Base
  belongs_to :user

  def score
    (total / 360 ) * ((deep / 360) / (times_woken + 1))
  end
end
