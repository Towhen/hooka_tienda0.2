import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/Contenidos/paramostrar.dart';
import 'package:hooka_tienda/Contenidos/product.dart';

class InterioMesa8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Table 8'),
        ),
        body: _EmptyTable8(),
      ),
    );
  }
}

class _EmptyTable8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.asset(
          'assets/images/Sad.png',
          height: 90,
        ),
        Text(
          'The are no products',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Center(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Go Shopping',
                style: TextStyle(color: Colors.white),
              ),
            ),
            //esto es para que al presinar el boton te envie  seleccionar productos
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _FullTable8 extends StatelessWidget {
  var i = 0xff3a3e3e3e;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ListView.builder(
                itemExtent: 250,
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ShoppingTable8_2(
                    product: product,
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(i),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Sub Total:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '0.0 US',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$59.99 US',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      FlatButton(
                        disabledColor: Colors.blue,
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingTable8 extends StatefulWidget {
  @override
  _ShoppingTable8 createState() => _ShoppingTable8();
}

class _ShoppingTable8 extends State<ShoppingTable8> {
  Widget bottonContainer(
      {@override String image, @override int prince, @override String name}) {
    var i = 0xff3a3e3e3e;
    return Flexible(
      child: Stack(
        children: <Widget>[
          Container(
            height: 270,
            width: 220,
            decoration: BoxDecoration(
              color: Color(i),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('4'),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "\$ $prince",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 510,
                  child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      bottonContainer(
                        image: 'images/hookaima.jpg',
                        name: 'Hooka',
                        prince: 20,
                      ),
                      bottonContainer(
                        image: 'images/savorizanteima.jpg',
                        name: 'Flavoring',
                        prince: 10,
                      ),
                      bottonContainer(
                        image: 'images/niveldenicotinaima.jpg',
                        name: 'Nicotine level',
                        prince: 10,
                      ),
                      bottonContainer(
                        image: 'images/bebidaisima.jpg',
                        name: 'Drinks',
                        prince: 15,
                      ),
                      bottonContainer(
                        image: 'images/aperitivosima.jpg',
                        name: 'Appetizers',
                        prince: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShoppingTable8_2 extends StatelessWidget {
  const ShoppingTable8_2({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          product.name,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: Colors.grey,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('4'),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${product.price} US',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
