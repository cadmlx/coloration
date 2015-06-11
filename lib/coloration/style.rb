module Coloration

  class Style

    attr_accessor :foreground, :background, :bold, :italic, :underline, :strike, :inverse, :comment

    # @param []
    # @param []
    # @return [void]
    # @todo
    def initialize(obj=nil, bg=nil)
      if obj
        case obj
        when String
          initialize_from_hash({ :foreground => obj }, bg)
        when Hash
          initialize_from_hash(obj, bg)
        end
      end
    end

    # @param []
    # @param []
    # @return [void]
    # @todo
    def initialize_from_hash(h, bg=nil)
      h.each do |key, value|
        key = :foreground if key == :fg
        key = :background if key == :bg

        if ["foreground", "background"].include?(key.to_s) && value.is_a?(String)
          value = Color::RGBA.from_html(value, bg)
        end
        send("#{key}=", value)
      end
    end

    # @return [Boolean]
    def blank?
      foreground.nil? && background.nil?
    end

  end # Style

end # Coloration
