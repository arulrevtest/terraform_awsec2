/*
  Web Servers
*/
resource "aws_instance" "apache" {
    ami = "${var.ins_ami}"
    availability_zone = "${var.az_zone}"
    instance_type = "${var.instance_types["web"]}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = "${var.public_subnet_id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Apache Web Server"
        Web = true
    }
}

/*
  Application Servers
*/
resource "aws_instance" "jiraconfluence" {
    ami = "${var.ins_ami}"
    availability_zone = "${var.az_zone}"
    instance_type = "${var.instance_types["app"]}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${var.private_subnet_id}"
    source_dest_check = false

    tags {
        Name = "Application Server"
        App = true
    }
}


/*
  Database Servers
*/
resource "aws_instance" "mariadb" {
    ami = "${var.ins_ami}"
    availability_zone = "${var.az_zone}"
    instance_type = "${var.instance_types["db"]}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${var.private_subnet_id}"
    source_dest_check = false

    ebs_block_device {
        device_name = "/dev/xvda"
        volume_type = "gp2"
        volume_size = 500
    }

    tags {
        Name = "DB Server"
        Db = true
    }
}

/*
resource "aws_ebs_volume" "ebs-volume-jiradb" {
    availability_zone = "${var.az_zone}"
    size = 500
    type = "gp2"
    tags {
        Name = "Jira Confluence DB volume"
    }
}

resource "aws_volume_attachment" "ebs-volume-jiradb-attachment" {
  device_name = "/dev/xvdb"
  volume_id = "${aws_ebs_volume.ebs-volume-jiradb.id}"
  instance_id = "${aws_instance.mariadb.id}"
}
*/

/*
  Bation Host
*/
resource "aws_instance" "bastion" {
  ami                         = "${var.amazon_linux_id}"
  instance_type               = "${var.instance_types["bastion"]}"
  vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
  subnet_id                   = "${var.public_subnet_id}"
  key_name                    = "${var.aws_key_name}"
  associate_public_ip_address = true

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  tags {
    Name = "Bastion Host"
    Bastion = true
  }
}

// EIP for Bastion
resource "aws_eip" "eip" {
  vpc      = true
  instance = "${aws_instance.bastion.id}"
}

resource "aws_elb" "elb" {
  name                        = "${var.name}-elb"
  subnets                     = ["${var.public_subnet_id}"]
  security_groups             = ["${aws_security_group.elb.id}"]
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 300
  idle_timeout                = 60

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  tags {
    Name = "${var.name}-elb"
  }
}




