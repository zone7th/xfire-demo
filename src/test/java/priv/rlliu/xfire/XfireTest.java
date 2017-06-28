/**
 *<p>
 * Copyright(c) @2016 
 * TIANPING AUTO INSURANCE CO.,LTD. 
 *</p>
 */
package priv.rlliu.xfire;

import java.net.MalformedURLException;
import java.net.URL;

import org.codehaus.xfire.XFireFactory;
import org.codehaus.xfire.client.Client;
import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.service.binding.ObjectServiceFactory;

import priv.rlliu.xfire.model.Book;
import priv.rlliu.xfire.service.IBookService;

/**
 *<p>
 *description:测试xfire简单类
 *</p>
 * @author ex_liuruili
 * @since 2016年9月23日
 * @see 
 */
public class XfireTest {
    public static void main(String[] args) throws MalformedURLException, Exception {  
        //这里是创建一个service，需要传入一个接口类，因为我们后面必须调用相应的接口方法  
        Service srcModel = new ObjectServiceFactory().create(IBookService.class);  
        //代理工厂，这里是为了后面创建相应的接口类  
        XFireProxyFactory factory = new XFireProxyFactory(XFireFactory.newInstance().getXFire());  
        //webservice地址，不需要加wsdl  
        String readerServiceUrl = "http://10.100.148.96:8088/xfire-demo/services/BookService"; 
        try {  
            //利用工厂返回相应的接口类  
            while(true){
                IBookService bookService = (IBookService)factory.create(srcModel,readerServiceUrl);  
                Book book = bookService.getBook("哈哈");
                System.out.println(book.getAuthor());
                
                IBookService bookService1 = (IBookService)factory.create(srcModel,readerServiceUrl);  
                Book book1 = bookService1.getBook("哈哈1");
                System.out.println(book1.getAuthor());
                
                IBookService bookService2 = (IBookService)factory.create(srcModel,readerServiceUrl);  
                Book book2 = bookService2.getBook("哈哈2");
                System.out.println(book2.getAuthor());
            }

        } catch (MalformedURLException e) {  
            e.printStackTrace();  
        }  
    }  
}
