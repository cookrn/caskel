#CASKEL

A [Monk](http://monkrb.com/) ruby skeleton for building test-driven API applications with Cassandra as a data store.

Suggestions, issues, forking, and pull requests are welcome and encouraged.

The only system this has been tested on is a Mac running Snow Leopard. [Cider](http://www.atmos.org/cider/) is used to bootstrap the development environment. If you would like to use the command line tools, you must have already installed Cassandra and be able to start it via the command line.

##Step by step instructions for Mac

1. Install Cider

	% curl \
	   http://github.com/atmos/cider/raw/master/bootstrap.sh \
	   -o - | sh
	
2. Which a few commands to make sure it worked - both of these should now point to binaries in your user home's Developer folder

	% which brew
	% which ruby

3. Install Cassandra

	% brew install cassandra
	
4. Install Monk

	% sudo gem install monk
	
5. Add the caskel skeleton to monk

	% monk add caskel git://github.com/cookrn/caskel.git
	
6. You should now see caskel when you list available skeletons

	% monk list
	
7. Head to your workspace

	% cd path/to/workspace
	
8. Create a project directory and head in to it - replace 'myapp' with the name of your application

	% mkdir myapp
	% cd myapp
	
9. Initialize a new application using caskel

	% monk init -s caskel
	
##Some More Tips

To start Cassandra, run the following from your application's root...

	monk cassandra start
	
To stop Cassandra...

	monk cassandra stop
	
To run the tests...

	monk test
	
To run your user stories...

	monk stories