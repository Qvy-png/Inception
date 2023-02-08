NAME = inception
YML = ./srcs/docker-compose.yml
MARIADB = ./mariadb
WORDPRESS = ./wordpress

all:
	sudo mkdir -p $(MARIADB)
	sudo chmod 777 $(MARIADB)
	sudo mkdir -p $(WORDPRESS)
	sudo chmod 777 $(WORDPRESS)
	sudo docker-compose -f $(YML) up -d --build

re : clean all
	
stop:
	sudo docker-compose -f $(YML) stop

clean:
	sudo docker-compose -f $(YML) down -v

fclean: clean
	sudo rm -rf $(MARIADB)
	sudo rm -rf $(WORDPRESS)
	sudo docker system prune -af

.PHONY: all re stop clean fclean
