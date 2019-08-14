
def position_to_string(position)
  positions_map = {
    d: "down",
    u: "up",
    f: "forward",
    o: "out",
    i: "in",
    b: "back"
  }
  "arm: #{positions_map[position[0].to_sym]}, forearm: #{positions_map[position[1].to_sym]}"
end

position_map = {0=>"dd", 1=>"df", 2=>"di", 3=>"do", 4=>"du", 5=>"ff", 6=>"fi", 7=>"fu", 8=>"od", 9=>"of", 10=>"oi", 11=>"oo", 12=>"ou", 13=>"ub", 14=>"ui", 15=>"uu"}
moves = [['dd', 'df'], ['dd', 'di'], ['dd', 'du'], ['dd', 'do'], ['dd', 'ff'], ['dd', 'uu'], ['dd', 'oo'], ['df', 'di'], ['df', 'du'], ['df', 'do'], ['df', 'fu'], ['df', 'ub'], ['df', 'of'], ['di', 'do'], ['di', 'du'], ['di', 'ui'], ['di', 'od'], ['di', 'fi'], ['du', 'do'], ['du', 'oi'], ['do', 'ui'], ['do', 'ou'], ['ff', 'uu'], ['ff', 'fu'], ['ff', 'oo'], ['ff', 'fi'], ['uu', 'ub'], ['uu', 'ui'], ['uu', 'oo'], ['fu', 'fi'], ['fu', 'ub'], ['fu', 'ou'], ['fi', 'ui'], ['fi', 'of'], ['ub', 'ui'], ['ui', 'ou'], ['oo', 'of'], ['oo', 'od'], ['oo', 'oi'], ['oo', 'ou'], ['of', 'od'], ['of', 'oi'], ['of', 'ou'], ['od', 'oi'], ['od', 'ou'], ['oi', 'ou']]
edges = moves.map{|move| move.map{|position| position_map.invert[position]}}
if false
  require 'yargraph'

end
if false
  tutting_graph = Yargraph::UndirectedGraph.new
  edges.each do |edge|
    tutting_graph.add_edge edge[0], edge[1]
  end
  cycles = tutting_graph.hamiltonian_cycles_brute_force
  # puts "Hamiltonian Cycles: #{cycles.count}"
  # cycles.each_with_index do |cycle, index|
  #   puts "Hamiltonian Cycle #{index}/#{cycles.count}"
  #   puts cycle.map{|position| position_to_string(position_map[position])}
  # end

  def coolness_score(array)
    return 1 if array.size == 1
    if array[0] == array[1]
      return coolness_score(array[1..array.size-1])
    else
      return coolness_score(array[1..array.size-1]) + 1
    end
  end

  def non_repeating_array?(array)
    return true if array.size == 3
    return false if array[0] == array[1]
    non_repeating_array?(array[1..array.size-1])
  end

  # cool_cycle = cycles.max{|cycle| coolness_score(cycle.map{|p| p[0]})}
  # puts cool_cycle.map{|position| position_to_string(position_map[position])}
end

if false
  sorted_cycles = cycles.sort_by{|cycle| coolness_score(cycle.map{|p| position_map[p][0]})}
  uncool_cycles = sorted_cycles.first(5)
  uncool_cycles.each_with_index do |cycle, index|
    puts "Uncool Hamiltonian Cycle #{index + 1}/#{uncool_cycles.count}"
    arm_positions = cycle.map{|p| position_map[p][0]}
    puts "Scoring: #{arm_positions}"
    puts "Score: #{coolness_score(arm_positions)}"
    puts cycle.map{|position| position_to_string(position_map[position])}
  end

  cool_cycles = sorted_cycles.last(5)
  cool_cycles.each_with_index do |cycle, index|
    puts "Cool Hamiltonian Cycle #{index + 1}/#{cool_cycles.count}"
    arm_positions = cycle.map{|p| position_map[p][0]}
    puts "Scoring: #{arm_positions}"
    puts "Score: #{coolness_score(arm_positions)}"
    puts cycle.map{|position| position_to_string(position_map[position])}
  end
end

Position = Struct.new(:id, :name)
position_strings = position_map.values.map { |p| position_to_string(p) }
both_arm_position_strings = position_strings.map { |p| "LEFT: #{p}"}.product(position_strings.map{ |p| "RIGHT: #{p}"}).map{|ps| ps.join(" | ")}
both_arm_position_map = both_arm_position_strings.each_with_index.map { |p, i| [i, p] }.to_h
# puts both_arm_position_map

arm_moves = [
  ["right",	"oo",	"oi",	"XY -180"],
  ["right",	"do",	"di",	"XY -180"],
  ["left",	"di",	"do",	"XY -180"],
  ["left",	"oi",	"oo",	"XY -180"],
  ["right",	"df",	"di",	"XY -90"],
  ["right",	"ff",	"fi",	"XY -90"],
  ["right",	"oo",	"of",	"XY -90"],
  ["right",	"of",	"oi",	"XY -90"],
  ["right",	"do",	"df",	"XY -90"],
  ["right",	"oo",	"ff",	"XY -90"],
  ["right",	"ou",	"fu",	"XY -90"],
  ["right",	"of",	"fi",	"XY -90"],
  ["right",	"ui",	"ub",	"XY -90"],
  ["left",	"df",	"do",	"XY -90"],
  ["left",	"ff",	"oo",	"XY -90"],
  ["left",	"fi",	"of",	"XY -90"],
  ["left",	"ub",	"ui",	"XY -90"],
  ["left",	"di",	"df",	"XY -90"],
  ["left",	"fi",	"ff",	"XY -90"],
  ["left",	"of",	"oo",	"XY -90"],
  ["left",	"oi",	"of",	"XY -90"],
  ["left",	"fu",	"ou",	"XY -90"],
  ["right",	"di",	"do",	"XY 180"],
  ["right",	"oi",	"oo",	"XY 180"],
  ["left",	"oo",	"oi",	"XY 180"],
  ["left",	"do",	"di",	"XY 180"],
  ["right",	"df",	"do",	"XY 90"],
  ["right",	"ff",	"oo",	"XY 90"],
  ["right",	"fu",	"ou",	"XY 90"],
  ["right",	"fi",	"of",	"XY 90"],
  ["right",	"ub",	"ui",	"XY 90"],
  ["right",	"di",	"df",	"XY 90"],
  ["right",	"fi",	"ff",	"XY 90"],
  ["right",	"of",	"oo",	"XY 90"],
  ["right",	"oi",	"of",	"XY 90"],
  ["left",	"df",	"di",	"XY 90"],
  ["left",	"ff",	"fi",	"XY 90"],
  ["left",	"oo",	"of",	"XY 90"],
  ["left",	"of",	"oi",	"XY 90"],
  ["left",	"do",	"df",	"XY 90"],
  ["left",	"oo",	"ff",	"XY 90"],
  ["left",	"ou",	"fu",	"XY 90"],
  ["left",	"of",	"fi",	"XY 90"],
  ["left",	"ui",	"ub",	"XY 90"],
  ["right",	"dd",	"du",	"XZ -180"],
  ["right",	"dd",	"uu",	"XZ -180"],
  ["right",	"df",	"ub",	"XZ -180"],
  ["right",	"di",	"ui",	"XZ -180"],
  ["right",	"od",	"ou",	"XZ -180"],
  ["left",	"dd",	"du",	"XZ -180"],
  ["left",	"dd",	"uu",	"XZ -180"],
  ["left",	"df",	"ub",	"XZ -180"],
  ["left",	"di",	"ui",	"XZ -180"],
  ["left",	"od",	"ou",	"XZ -180"],
  ["right",	"dd",	"df",	"XZ -90"],
  ["right",	"dd",	"ff",	"XZ -90"],
  ["right",	"df",	"du",	"XZ -90"],
  ["right",	"df",	"fu",	"XZ -90"],
  ["right",	"di",	"fi",	"XZ -90"],
  ["right",	"ff",	"uu",	"XZ -90"],
  ["right",	"ff",	"fu",	"XZ -90"],
  ["right",	"uu",	"ub",	"XZ -90"],
  ["right",	"fu",	"ub",	"XZ -90"],
  ["right",	"fi",	"ui",	"XZ -90"],
  ["right",	"of",	"ou",	"XZ -90"],
  ["right",	"od",	"of",	"XZ -90"],
  ["left",	"dd",	"df",	"XZ -90"],
  ["left",	"dd",	"ff",	"XZ -90"],
  ["left",	"df",	"du",	"XZ -90"],
  ["left",	"df",	"fu",	"XZ -90"],
  ["left",	"di",	"fi",	"XZ -90"],
  ["left",	"ff",	"uu",	"XZ -90"],
  ["left",	"ff",	"fu",	"XZ -90"],
  ["left",	"uu",	"ub",	"XZ -90"],
  ["left",	"fu",	"ub",	"XZ -90"],
  ["left",	"fi",	"ui",	"XZ -90"],
  ["left",	"of",	"ou",	"XZ -90"],
  ["left",	"od",	"of",	"XZ -90"],
  ["right",	"du",	"dd",	"XZ 180"],
  ["right",	"uu",	"dd",	"XZ 180"],
  ["right",	"ub",	"df",	"XZ 180"],
  ["right",	"ui",	"di",	"XZ 180"],
  ["right",	"ou",	"od",	"XZ 180"],
  ["left",	"du",	"dd",	"XZ 180"],
  ["left",	"uu",	"dd",	"XZ 180"],
  ["left",	"ub",	"df",	"XZ 180"],
  ["left",	"ui",	"di",	"XZ 180"],
  ["left",	"ou",	"od",	"XZ 180"],
  ["right",	"of",	"od",	"XZ 90"],
  ["right",	"df",	"dd",	"XZ 90"],
  ["right",	"ff",	"dd",	"XZ 90"],
  ["right",	"du",	"df",	"XZ 90"],
  ["right",	"fu",	"df",	"XZ 90"],
  ["right",	"fi",	"di",	"XZ 90"],
  ["right",	"uu",	"ff",	"XZ 90"],
  ["right",	"fu",	"ff",	"XZ 90"],
  ["right",	"ub",	"uu",	"XZ 90"],
  ["right",	"ub",	"fu",	"XZ 90"],
  ["right",	"ui",	"fi",	"XZ 90"],
  ["right",	"ou",	"of",	"XZ 90"],
  ["left",	"of",	"od",	"XZ 90"],
  ["left",	"df",	"dd",	"XZ 90"],
  ["left",	"ff",	"dd",	"XZ 90"],
  ["left",	"du",	"df",	"XZ 90"],
  ["left",	"fu",	"df",	"XZ 90"],
  ["left",	"fi",	"di",	"XZ 90"],
  ["left",	"uu",	"ff",	"XZ 90"],
  ["left",	"fu",	"ff",	"XZ 90"],
  ["left",	"ub",	"uu",	"XZ 90"],
  ["left",	"ub",	"fu",	"XZ 90"],
  ["left",	"ui",	"fi",	"XZ 90"],
  ["left",	"ou",	"of",	"XZ 90"],
  ["right",	"fu",	"fi",	"YX -90"],
  ["left",	"fi",	"fu",	"YX -90"],
  ["right",	"fi",	"fu",	"YX 90"],
  ["left",	"fu",	"fi",	"YX 90"],
  ["right",	"do",	"ui",	"YZ -180"],
  ["left",	"ui",	"do",	"YZ -180"],
  ["right",	"uu",	"ui",	"YZ -90"],
  ["left",	"ui",	"uu",	"YZ -90"],
  ["right",	"dd",	"do",	"YZ -90"],
  ["right",	"dd",	"oo",	"YZ -90"],
  ["right",	"df",	"of",	"YZ -90"],
  ["right",	"di",	"od",	"YZ -90"],
  ["right",	"du",	"oi",	"YZ -90"],
  ["right",	"do",	"ou",	"YZ -90"],
  ["right",	"oo",	"ou",	"YZ -90"],
  ["right",	"di",	"dd",	"YZ -90"],
  ["right",	"du",	"di",	"YZ -90"],
  ["right",	"do",	"du",	"YZ -90"],
  ["right",	"oo",	"uu",	"YZ -90"],
  ["right",	"ou",	"ui",	"YZ -90"],
  ["right",	"od",	"oo",	"YZ -90"],
  ["right",	"oi",	"od",	"YZ -90"],
  ["right",	"ou",	"oi",	"YZ -90"],
  ["left",	"dd",	"di",	"YZ -90"],
  ["left",	"di",	"du",	"YZ -90"],
  ["left",	"du",	"do",	"YZ -90"],
  ["left",	"uu",	"oo",	"YZ -90"],
  ["left",	"ui",	"ou",	"YZ -90"],
  ["left",	"oo",	"od",	"YZ -90"],
  ["left",	"od",	"oi",	"YZ -90"],
  ["left",	"oi",	"ou",	"YZ -90"],
  ["left",	"do",	"dd",	"YZ -90"],
  ["left",	"oo",	"dd",	"YZ -90"],
  ["left",	"of",	"df",	"YZ -90"],
  ["left",	"od",	"di",	"YZ -90"],
  ["left",	"oi",	"du",	"YZ -90"],
  ["left",	"ou",	"do",	"YZ -90"],
  ["left",	"ou",	"oo",	"YZ -90"],
  ["right",	"ui",	"do",	"YZ 180"],
  ["left",	"do",	"ui",	"YZ 180"],
  ["right",	"ui",	"uu",	"YZ 90"],
  ["left",	"uu",	"ui",	"YZ 90"],
  ["right",	"dd",	"di",	"YZ 90"],
  ["right",	"di",	"du",	"YZ 90"],
  ["right",	"du",	"do",	"YZ 90"],
  ["right",	"uu",	"oo",	"YZ 90"],
  ["right",	"ui",	"ou",	"YZ 90"],
  ["right",	"oo",	"od",	"YZ 90"],
  ["right",	"od",	"oi",	"YZ 90"],
  ["right",	"oi",	"ou",	"YZ 90"],
  ["right",	"do",	"dd",	"YZ 90"],
  ["right",	"oo",	"dd",	"YZ 90"],
  ["right",	"of",	"df",	"YZ 90"],
  ["right",	"od",	"di",	"YZ 90"],
  ["right",	"oi",	"du",	"YZ 90"],
  ["right",	"ou",	"do",	"YZ 90"],
  ["right",	"ou",	"oo",	"YZ 90"],
  ["left",	"dd",	"do",	"YZ 90"],
  ["left",	"dd",	"oo",	"YZ 90"],
  ["left",	"df",	"of",	"YZ 90"],
  ["left",	"di",	"od",	"YZ 90"],
  ["left",	"du",	"oi",	"YZ 90"],
  ["left",	"do",	"ou",	"YZ 90"],
  ["left",	"oo",	"ou",	"YZ 90"],
  ["left",	"di",	"dd",	"YZ 90"],
  ["left",	"du",	"di",	"YZ 90"],
  ["left",	"do",	"du",	"YZ 90"],
  ["left",	"oo",	"uu",	"YZ 90"],
  ["left",	"ou",	"ui",	"YZ 90"],
  ["left",	"od",	"oo",	"YZ 90"],
  ["left",	"oi",	"od",	"YZ 90"],
  ["left",	"ou",	"oi",	"YZ 90"]
]
grouped_arm_moves = arm_moves.group_by {|m| m[3]}.map{|g, values| [g, values.group_by {|m| m[0]}] }.to_h
both_arm_edges = grouped_arm_moves.values.flat_map{|h| h["left"].product(h["right"]) }.map do |m|
  [
    "#{m[0][0].upcase} #{position_to_string(m[0][1])} | #{m[1][0].upcase} #{position_to_string(m[1][1])}",
    "#{m[0][0].upcase} #{position_to_string(m[0][2])} | #{m[1][0].upcase} #{position_to_string(m[1][2])}"
  ]
end

require 'rgl/adjacency'
participating_both_arm_positions = both_arm_edges.flatten.uniq
participating_both_arm_positions_mapping = participating_both_arm_positions.each_with_index.map{|p, i| [p, i]}.to_h
rubiks_graph = RGL::DirectedAdjacencyGraph.new
both_arm_edges.each do |edge|
  ids = edge.map{|e| participating_both_arm_positions_mapping[e]}
  rubiks_graph.add_edge(ids.first, ids.last)
  rubiks_graph.add_edge(ids.last, ids.first)
end

RUBIKS_GRAPH = rubiks_graph
require 'tutting'
starting_position = "LEFT arm: down, forearm: down | RIGHT arm: down, forearm: down"
starting_position_id = participating_both_arm_positions_mapping[starting_position]
paths = Tutting::PathFinder.find_paths_from_vertex(rubiks_graph, starting_position_id, 9, '8_move_paths.txt')
cycles = paths.select { |path| path.last == starting_position_id && path.size > 8 }
cycles.each_with_index do |path, index|
  puts "Path ##{index}"
  path.each do |vertex_id|
    puts participating_both_arm_positions_mapping.invert[vertex_id]
  end
end


# require 'rgl/dot'
# rubiks_graph.write_to_graphic_file('jpg')

if false # takes over 5 hours *shrug*
  cycles = rubiks_graph.cycles
  File.open("cycle_ids.txt", "w") do |file|
    file.puts cycles
  end

  file = File.open("cycles.txt", "w")
  cycles.each do |cycle|
    file.puts "new cycle"
    puts "new cycle"
    file.puts cycle.map{|p_id| participating_both_arm_positions_mapping.invert[p_id]}
    puts cycle.map{|p_id| participating_both_arm_positions_mapping.invert[p_id]}
  end
  file.close
end
