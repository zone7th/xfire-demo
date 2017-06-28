/**
 *<p>
 * Copyright(c) @2016 
 * TIANPING AUTO INSURANCE CO.,LTD. 
 *</p>
 */
package priv.rlliu.xfire.service;

import org.springframework.stereotype.Service;

import priv.rlliu.xfire.model.Book;

/**
 *<p>
 *description: 书本Service层
 *</p>
 * @author ex_liuruili
 * @since 2016年9月23日
 * @see 
 */
@Service
public class BookServiceImpl implements IBookService {

    /* 
     * @see priv.rlliu.xfire.service.IBookService#getBook(java.lang.String)
     */
    public Book getBook(String name) {
        Book book = new Book();
        book.setName(name);
        book.setAuthor("隔壁老王");
        book.setPrice(998.99);
        System.out.println("有请求过来，请求书名：" + name);
        
        
        return book;
    }
    
}
