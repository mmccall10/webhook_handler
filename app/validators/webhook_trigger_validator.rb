class WebhookTriggerValidator < ActiveModel::Validator
  def validate(record)
    pattern = /([gl]te||eq|contains|(starts|ends)_with):\w+/
    message = "Does not meed trigger format conditions. ex. int:gte:1000 #{pattern.inspect}"
    record.errors[:trigger] << message unless record.trigger.match?(pattern)

    operator, value = record.trigger.split(':')
    return record unless %w[gte lte].include?(operator)

    record.errors[:trigger] << "must pass an integer with gte or lte conditions." if Integer(value, exception: false).nil?
  end
end
