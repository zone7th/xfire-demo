/**
 *<p>
 * Copyright(c) @2016 
 * TIANPING AUTO INSURANCE CO.,LTD. 
 *</p>
 */
package priv.rlliu.xfire.service;

import priv.rlliu.xfire.model.Book;

/**
 *<p>
 *description: 书本Service接口
 *</p>
 * @author ex_liuruili
 * @since 2016年9月23日
 * @see 
 */
public interface IBookService {
    /**
     * 
     *<p>
     *description:获取书本
     *</p>
     *@param name
     *@return
     * @author ex_liuruili
     * @see
     */
    public Book getBook(String name);
    
}
