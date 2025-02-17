require 'algo_templates/base_helper'
class Templates::Python2 < Templates::BaseHelper
  def initialize(input_json, output_json)
    super(input_json, output_json, 'python2')

    @head = build_head
    @body = build_body
    @tail = build_tail
  end

  def build_head
    ''
  end

  def build_body
    ["def solve(#{build_argument_list.join(', ')}):", "\t# CODE HERE"].join("\n")
  end

  def build_tail
    # build inputs
    tail_code = []
    tail_code << "if __name__ == '__main__':"
    tail_code += input_code
    # build call
    tail_code << "#{get_output_signature.join(', ')} = solve(#{build_parameter_list.join(', ')})"
    # build prints
    tail_code += output_code
    tail_code.join("\n\t")
  end

  def input_code
    inputs = []
    @input_format.each do |value|
      inputs += case value[:variable][:datastructure]
                when 'string'
                  ["#{value[:name]} = raw_input()"]
                when 'array', 'list', 'tuple'
                  ["#{value[:name]} = list(map(#{value[:variable][:dtype]}, raw_input().split()))"]
                when 'primitive'
                  ["#{value[:name]} = #{value[:variable][:dtype]}(raw_input())"]
                when 'matrix'
                  ['n,m = list(map(int, raw_input().split()))', "#{value[:name]}=[ [#{value[:variable][:dtype]}(j) for j in raw_input().split()] for i in xrange(n)]"]
                end
    end
    inputs
  end

  def output_code
    outputs = []
    @output_format.each do |value|
      outputs += case value[:variable][:datastructure]
                 when 'string', 'primitive'
                   ["print(#{value[:name]})"]
                 when 'list', 'tuple', 'array'
                   ["for i in #{value[:name]}:", "\tprint(i, end = ' ')"]
                 when 'matrix',
                    ["for i in #{value[:name]}:", "\tfor j in i:", "\t\tprint(j, end = ' ')", "\tprint()"]
                 end
    end
    outputs
  end
end
