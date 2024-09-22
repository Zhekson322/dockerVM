Network создавалась по инструкции - https://blog.oddbit.com/post/2018-03-12-using-docker-macvlan-networks/
docker network create -d macvlan -o parent=eno1 \
  --subnet 192.168.1.0/24 \
  --gateway 192.168.1.1 \
  --ip-range 192.168.1.192/27 \ #диапазон по маске 27 = 32 адреса
  --aux-address 'host=192.168.1.223' \ #фикс адреса для интерфейса
  mynet
