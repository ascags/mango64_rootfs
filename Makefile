ROOT = $(PWD)

DIRS =  bash-4.1 busybox-1.17.0 sysvinit-2.88dsf/src

all: make_pkg

make_pkg:
	@echo ""
	@for dirs in $(DIRS); do \
		if [ -d $${dirs} ]; then \
			echo "******************   Entering [$${dirs}]"; 	\
			cd $${dirs};		\
			$(MAKE);			\
			if [ $$? != '0' ]; then 			\
				echo "";						\
				exit 1;							\
			fi;									\
			echo "******************   Leaving [$${dirs}]"; 	\
			echo "";							\
			cd $(ROOT); \
			else		\
				echo "Can't find directory [$${dirs}]";	\
				exit 1;									\
		fi;				\
	done;

clean:
	@echo ""
	@for dirs in $(DIRS); do \
		if [ -d $${dirs} ]; then \
			echo "******************   Entering [$${dirs}]"; \
			cd $${dirs}; \
			$(MAKE) clean; \
			echo "******************   Leaving [$${dirs}]"; \
			echo "";	\
			cd $(ROOT); \
			else		\
				echo "Can't find directory [$${dirs}]";	\
				exit 1;									\
		fi;	\
	done;


install:
	@echo ""
	@for dirs in $(DIRS); do \
		if [ -d $${dirs} ]; then \
			echo "******************   Entering [$${dirs}]"; \
			cd $${dirs}; \
			$(MAKE) install; \
			echo "******************   Leaving [$${dirs}]"; \
			echo "";	\
			cd $(ROOT); \
			else		\
				echo "Can't find directory [$${dirs}]";	\
				exit 1;									\
		fi;	\
	done;
