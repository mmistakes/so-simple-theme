---
layout: post
title: Introduction to Brain Networks in Python
categories: blog
excerpt: "Brain Networks in Python makes available the python code the Whitaker Lab uses to analyse structural covariance brain networks."
tags: ['open-science', 'reproducibility', 'structural-covariance', 'brain-networks']
image:
  feature:
link:
date: 2017-06-02
modified:
share: true
author: isla_staden
---

Brain Networks in Python is a project hosted on [GitHub](https://github.com/WhitakerLab/BrainNetworksInPython) that makes available the python code the Whitaker Lab uses to analyse structural covariance brain networks.

In short, Brain Networks in Python deduces a structural covariance network from data on cortical thickness in 308 brain regions for a cohort of participants.

In this blog I would like to explain a little about what it does and how to use it.

### Setting up

To use Brain Networks in Python yourself I recommend cloning the [GitHub repository](https://github.com/WhitakerLab/BrainNetworksInPython). It contains some example data and a Jupyter notebook to walk you through usage of the main functions.

You can find a list of the libraries you'll need to install at the [Getting Started](https://github.com/WhitakerLab/BrainNetworksInPython/wiki/Getting-Started) page of the Brain Networks in Python wiki.

## Creating a Correlation Matrix

The [`corrmat_from_regional_measures.py`](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/WRAPPERS/corrmat_from_regionalmeasures.py) wrapper does the initial processing of our data.

We feed it a [csv file](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/exemplary_brains/PARC_500aparc_thickness_behavmerge.csv) of our cortical thickness measures, along with two text files: a [list of the brain regions](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/exemplary_brains/500.names.txt), and a [list of cartesian coordinates](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/exemplary_brains/500.centroids.txt) for those regions.

It outputs a correlation matrix of cortical thickness by brain region. There is a nice command in [`visualisation_commands.py`](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/SCRIPTS/visualisation_commands.py) to get a look at this matrix.   

```
visualisation_commands.view_corr_mat(corrmat_file, corrmat_picture, cmap_name='gnuplot2')  
```

<figure>
	<a>
    <img src="/images/corrmat_picture.png"
         alt="Our correlation matrix">
  </a>
</figure>

One thing to note about this visualisation of the correlation matrix is that we put our names (of brain regions) in left to right order. In the figure the pale off-diagonals represent a high correlation between cortical thickness in symmetric regions, which fits with what is already known about the strong left-right links within the brain.


## Network Analysis

The [`network_analysis_from_corrmat.py`](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/WRAPPERS/network_analysis_from_corrmat.py) wrapper assembles a lot of information about the network

### Creating the graph

[`network_analysis_from_corrmat.py`](https://github.com/WhitakerLab/BrainNetworksInPython/blob/master/WRAPPERS/network_analysis_from_corrmat.py) starts by creating a graph from our correlation matrix at a specified cost n. Let's break down how this works:

First of all, the brain is certainly a connected network, and we would like to get a connected graph so we start by taking a *minimum spanning tree*.

As a side note, if we got an *interesting* disconnected graph, it would be very interesting, but practically we are just trying to prevent lonely vertices.

We want to end up with an edge density of n/100, so we add in the remaining edges with the highest correlation values, up until we reach that threshold.  

And that's all. Once we've finished making the graph we move on to taking some measures.


### Nodal Measures

What are our nodal measures?  

* __degree :__ the degree of each node

* __average shortest path length :__ for a node `v`, this is the average of the sum of the shortest path lengths from `v` to all other `n-1` nodes.

* __closeness :__  the closeness centrality of a node `v` is the reciprocal of the
    sum of the shortest path lengths from `v` to all `n-1` other nodes, normalised by `n-1`.

* __betweenness :__ the betweenness centrality of a node `v` is the sum over all pairs of vertices `s,t` of the shortest `s-t` path that passes through `v` over the shortest `s-t` path.

* __clustering :__ the clustering coefficient is the fraction of a node’s neighbors that are neighbors to each other.

* __participation coefficient and module assignment :__ the participation coefficient reports on how likely a node is to connect to members of the same "community" or module, vs connecting to other groups of nodes.

* __average and total distance :__ these measures report on the euclidean distance from one node to all the nodes it is connected to.

### Creating Random Graphs

When we take global measures of our graph we'd like to have something to compare them to. To this end we create a number (n_rand) of (semi-)random graphs. We prefer to compare graphs with the same degree distribution (why? try to explain) so we create our random graphs from our first graph by performing a series of double edge swaps.

We take a random pair of edges ab and cd, and we try to replace them with ac and bd.

```

                a----b         a    b
                        --->   |    |
                c----d         c    d

```

If either of these new edges already exists, we abort and choose another pair, otherwise, we have changed the graph while keeping the degree of each node fixed.
For more information about double edge swapping, see [here](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.12.9062)

### Global Measures

We calculate six global measures for our graph, and for our random graphs

* __Clustering :__ The average clustering coefficient across all nodes.
* __Shortest path length :__ The average shortest path length over all pairs of vertices
* __Assortativity :__ The correlation coefficient between the degrees of all nodes connected by an edge. Positive assortativity indicates that nodes tend to share edges with other nodes with similar degree.
* __Modularity :__ Informally, the extent to which the network can be divided into distinct communities. [Wikipedia](https://en.wikipedia.org/wiki/Modularity_(networks)) with the full story.
* __Efficiency :__ The average inverse shortest path length (where inverse means the reciprocal)
* __Small world :__

### Rich Club

Informally, we are measuring the extent to which __well-connected nodes are connected to each other__. We take k as a parameter, and for for nodes of degree >= k, we ask how many of their neighbours also have degree >= k. This depends heavily on the degree distribution for the graph, so we compare with random graphs of the same degree distribution. Head to [Wikipedia](https://en.wikipedia.org/wiki/Rich-club_coefficient) for a formal definition of the rich club.

### Visualising the data

We have a function in make_figures.py to produce a network summary figure.

<figure>
	<a>
    <img src="/images/NetworkSummary.png"
         alt="Network summary figure">
  </a>
</figure>

The figures are a little sparsely labelled so I'll explain what we're looking at.  
anti clockwise from the top:

* A sagittal and axial view of our brain networks, although in truth, the graph at full cost usually has too many edges to look at, so we have scaled the nodes by their degree in the full cost graph (for whatever your cost is, ours was 10), but we only include the edges calculated at cost 2.

* A histogram of the degree distribution for our graph

* This figure describes our rich club values parameterised by degree, showing the mean and confidence intervals of the random graphs in grey, and the structural covariance graph in blue.

* A comparison our network measures of our true graph in blue to our random graphs in grey
