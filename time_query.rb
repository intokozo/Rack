class TimeQuery
  FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(formats)
    @formats = formats.split(',')
    @time = Time.now
  end

  def success?
    @formats.any? && unknown_formats.empty?
  end

  def result
    @formats
      .map { |format| @time.strftime(FORMATS[format]) }
      .join('-')
  end

  def unknown_formats
    @unknown_formats ||= @formats - FORMATS.keys
  end
end
