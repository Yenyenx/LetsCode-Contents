# Finding proxy information on my computer

Here is one possible ways to get your specific proxy information. It is not the only one. It only requires Chrome to be installed on your computer.

1. Open Chrome ;
1. In the address bar, type the url : <chrome://net-internals/#sockets> and hit enter ;
1. Check the first table. You should be able to read your *proxy* and the *port number*: **proxy.example.net:1234**. Here the proxy url is *proxy.example.net* and the port number is *1234*.
1. Plug these parameters where need/request by your R program so as to be able to interact with outside world. Enjoy.