# Test-Table-View-Dequeue
To answer the question: how many cells that an UITableView needs to create for dequeue purpose.

I created a simple TestTableViewController that extends UITableViewController and has information described as below.
```
class TestTableViewController: UITableViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TestTableViewCell.identifier,
            for: indexPath) as! TestTableViewCell
        return cell
    }

    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0
    }
}
```

In this sample, I used storyboard so the init with coder method is called. I put a simple log to see exactly how many times the method is called.
```
class TestTableViewCell: UITableViewCell {
    static var count = 1
    static let identifier = "TestTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .green
        print("init with style is called \(TestTableViewCell.count) times")
        TestTableViewCell.count += 1
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init with CODER is called \(TestTableViewCell.count) times")
        TestTableViewCell.count += 1
        self.backgroundColor = .blue
    }
}
```

Note: In this example I used only one section

| Device pixels | Number of rows in a section | Height of a row | Number of times init method is called == number of TableView cell objects that available for dequeue |
|-|-|-|-|
| 896px | 1000 | 10.0 | 86 |
| 896px | 1000 | 20.0 | 43 |
| 896px | 1000 | 200.0| 20 |
| 896px | 19 | 200.0 | 19 |
| 896px | 10 | 200.0 | 10 |

You can realize that if the number of rows is less than 20, UITableView will create that amount of objects
Or it will create the amount of cell objects to be able to cover 2 times of the screen length:

```
if numberOfRows < 20 {
    number of cell created = numberOfRows
} else {
    number of cell created = (numberOfRows * height) / screenHeight * 2
}
```

