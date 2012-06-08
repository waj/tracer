require "tracer/version"
require "uuid"

class Tracer

  def self.info tag, message, vars = {}
    puts "[#{context}] #{Time.now} I, #{tag} - #{message || ''}, #{vars}"
  end

  def self.scope tag, message, vars = {}
    current_context = context
    current_subsequence = subsequence
    Thread.current[:context] = "#{current_context}.#{current_subsequence}"
    Thread.current[:subsequence] = nil
    info "#{tag}/BEGIN", message, vars
    start = Time.now
    yield
  ensure
    stop = Time.now
    info "#{tag}/END", nil, :ellapsed => stop - start
    Thread.current[:context] = current_context
    Thread.current[:subsequence] = current_subsequence + 1
  end

  private

  def self.context
    Thread.current[:context] ||= UUID.generate
  end

  def self.subsequence
    Thread.current[:subsequence] ||= 0
  end

end
