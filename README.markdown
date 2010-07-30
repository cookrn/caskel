#CASKEL

A [Monk](http://monkrb.com/) ruby skeleton for building test-driven JSON API applications with Cassandra as a data store.

Suggestions, issues, forking, and pull requests are welcome and encouraged.

The only system this has been tested on is a Mac running Snow Leopard. [Cider](http://www.atmos.org/cider/) is used to bootstrap the development environment. If you would like to use the command line tools, you must have already installed Cassandra and be able to start it via the command line.

##Environment setup instructions for Mac

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
		
##Caskel project setup for Mac
	
1. Add the caskel skeleton to monk

		% monk add caskel git://github.com/cookrn/caskel.git
	
2. You should now see caskel when you list available skeletons

		% monk list
	
3. Head to your workspace

		% cd path/to/workspace
	
4. Create a project directory and head in to it - replace 'myapp' with the name of your application

		% mkdir myapp
		% cd myapp
	
5. Initialize a new application using caskel

		% monk init -s caskel
		
6. Download all the dependencies

		% dep vendor --all
	
##Some More Caskel Tips

To start Cassandra, run the following from your application's root...

	% monk cassandra start
	
To stop Cassandra...

	% monk cassandra stop
	
To run the tests...

	% monk test
	
To run your user stories...

	% monk stories
	
##TODO

* Investigate including [Bigrecord](http://github.com/openplaces/bigrecord) - this has begun
* Include more of a base application utilizing Cassandra with some model classes to better showcase functionality
* Build out testing more