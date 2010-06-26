#CASKEL

A Monk ruby skeleton for building test-driven API applications with Cassandra as a data store.

Suggestions, issues, forking, and pull requests are welcome and encouraged.

The only system this has been tested on is a Mac running Snow Leopard. [Cider](http://www.atmos.org/cider/) is used to bootstrap the development environment. If you would like to use the command line tools, this depends on Cassandra already being installed and executable via the command line.

To start Cassandra, run the following from your application's root...

	monk cassandra start
	
To stop Cassandra...

	monk cassandra stop
	
To run the tests...

	monk test
	
To run your user stories...

	monk stories