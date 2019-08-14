module Tutting
  class PathFinder
    def self.find_paths_from_vertex(graph, starting_vertex, path_limit = nil, file_path = nil)
      paths = []
      current_path = [starting_vertex]
      paths << current_path
      graph.adjacent_vertices(starting_vertex).each do |adjacent_vertex|
        paths = paths + find_paths(current_path, adjacent_vertex, graph, starting_vertex, path_limit, file_path)
      end
      paths
    end

    def self.find_paths(current_path, vertex, graph, starting_vertex, path_limit, file_path=nil)
      paths = []
      current_path = current_path + [vertex]
      paths << current_path
      if vertex == starting_vertex
        # if current_path.size == 17
        #   File.write(file_path, "#{current_path}\n", mode: 'a') if file_path
        # end
        return paths
      end
      return paths if path_limit && current_path.size >= path_limit

      already_visited_vertices = current_path - [starting_vertex]
      adjacent_vertices = graph.adjacent_vertices(vertex)
      next_vertices = adjacent_vertices - already_visited_vertices

      next_vertices.each do |next_vertex|
        paths = paths + find_paths(current_path, next_vertex, graph, starting_vertex, path_limit, file_path)
      end

      paths
    end
  end
end


# - can't backtrack
# # base case
# - no adjacent_vertices
# - limit reached
