CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT,
    user_ID VARCHAR(16) NOT NULL,
    user_PW VARCHAR(16) NOT NULL,
    nickname VARCHAR(16) NOT NULL,
    pf_link VARCHAR(256) NOT NULL,
    pf_message VARCHAR(80) NOT NULL,
    user_withdraw TINYINT NOT NULL DEFAULT 0,
    join_date DATETIME NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    id INT NOT NULL AUTO_INCREMENT,
    ch_name VARCHAR(16) NOT NULL,
    ch_user INT NOT NULL,
    ch_link VARCHAR(256) NOT NULL,
    ch_maxP INT NOT NULL,
    ch_withdraw TINYINT NOT NULL DEFAULT 0,
    ch_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ch_user)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
	id INT NOT NULL AUTO_INCREMENT,
    chat_message VARCHAR(128) NOT NULL,
    chat_user INT NOT NULL,
    chat_ch INT NOT NULL,
    chat_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (chat_user)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (chat_ch)
    REFERENCES channels(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
	id INT NOT NULL AUTO_INCREMENT,
    follower_user INT NOT NULL,
    followee_user INT NOT NULL,
    follow_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (follower_user)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee_user)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
	id INT NOT NULL AUTO_INCREMENT,
    block_user INT NOT NULL,
    blocked_user INT NOT NULL,
    block_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (block_user)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked_user)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;