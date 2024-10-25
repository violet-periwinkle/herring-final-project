class Color < ApplicationRecord
  validates :palette, presence: true
  validates :hex_code, presence: true
  validates :proportion, presence: true
  validate :validate_color
  belongs_to :palette
  def validate_color
    color_regexes = [ /^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/, /^rgb\(\s*(\d{1,3}\s*,\s*){2}\d{1,3}\s*\)$/, /^rgba\(\s*(\d{1,3}\s*,\s*){3}(0|1|0?\.\d+)\s*\)$/, /^hsl\(\s*(\d{1,3}\s*,\s*){2}(\d{1,3}|100%)\s*\)$/, /^hsla\(\s*(\d{1,3}\s*,\s*){3}(0|1|0?\.\d+)\s*\)$/ ]
    css_color_names = %w( aliceblue antiquewhite aqua aquamarine azure beige bisque black blanchedalmond blue blueviolet brown burlywood cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan darkblue darkcyan darkgoldenrod darkgray darkgreen darkkhaki darkmagenta darkolivegreen darkorange darkorchid darkred darksalmon darkseagreen darkslateblue darkslategray darkturquoise darkviolet deeppink deepskyblue dimgray dodgerblue firebrick floralwhite forestgreen fuchsia gainsboro ghostwhite gold goldenrod gray green greenyellow honeydew hotpink indianred indigo ivory khaki lavender lavenderblush lawngreen lemonchiffon lightblue lightcoral lightcyan lightgoldenrodyellow lightgray lightgreen lightpink lightsalmon lightseagreen lightskyblue lightslategray lightsteelblue lightyellow lime limegreen linen magenta maroon mediumaquamarine mediumblue mediumorchid mediumpurple mediumseagreen mediumslateblue mediumspringgreen mediumturquoise mediumvioletred midnightblue mintcream mistyrose moccasin navajowhite navy oldlace olive olivedrab orange orangered orchid palegoldenrod palegreen paleturquoise palevioletred papayawhip peachpuff peru pink plum powderblue purple red rosybrown royalblue saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray snow springgreen steelblue tan teal thistle tomato turquoise violet wheat white whitesmoke yellow yellowgreen )
    unless color_regexes.any? { |regex| regex.match?(hex_code) } || css_color_names.include?(hex_code.downcase)
      errors.add(:hex_code, "not a valid color" )
    end
  end
end
