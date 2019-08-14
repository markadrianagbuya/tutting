require 'rgl/adjacency'

module Tutting
  RSpec.describe PathFinder do
    it 'finds the paths' do
      graph = RGL::DirectedAdjacencyGraph[1,2,2,3]
      paths = described_class.find_paths_from_vertex(graph, 1)
      expect(paths).to include([1])
      expect(paths).to include([1, 2])
      expect(paths).to include([1, 2, 3])
    end

    it 'finds the paths in a cyclical graph' do
      graph = RGL::DirectedAdjacencyGraph[1,2,2,3,3,1]
      paths = described_class.find_paths_from_vertex(graph, 1)
      expect(paths).to include([1])
      expect(paths).to include([1, 2])
      expect(paths).to include([1, 2, 3])
      expect(paths).to include([1, 2, 3, 1])
    end

    it 'finds the paths in a cyclical bidrectional graph' do
      graph = RGL::DirectedAdjacencyGraph[1,2,2,3,3,1,1,3,3,2,2,1]
      paths = described_class.find_paths_from_vertex(graph, 1)
      expect(paths).to include([1])
      expect(paths).to include([1, 2])
      expect(paths).to include([1, 2, 3])
      expect(paths).to include([1, 2, 3, 1])
      expect(paths).to include([1, 3])
      expect(paths).to include([1, 3, 2])
      expect(paths).to include([1, 3, 2, 1])
    end

    it 'finds the paths in a cyclical bidrectional graph with a limit' do
      graph = RGL::DirectedAdjacencyGraph[1,2,2,3,3,1,1,3,3,2,2,1]
      paths = described_class.find_paths_from_vertex(graph, 1, 3)
      expect(paths).to include([1])
      expect(paths).to include([1, 2])
      expect(paths).to include([1, 2, 3])
      expect(paths).to_not include([1, 2, 3, 1])
      expect(paths).to include([1, 3])
      expect(paths).to include([1, 3, 2])
      expect(paths).to_not include([1, 3, 2, 1])
    end
  end
end
