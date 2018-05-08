package com.feedz.utils;

import com.feedz.controllers.FeedController;
import com.feedz.models.Feed;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.feed.synd.SyndImage;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

/**
 *
 * @author gfriedman
 */
public class FeedUtilities {
    
    public static Feed createFeed(String url) {
        try (CloseableHttpClient client = HttpClients.createMinimal()) {
            HttpUriRequest request = new HttpGet(url);
            try (
                CloseableHttpResponse response = client.execute(request);
                InputStream stream = response.getEntity().getContent()
            ) {
                SyndFeedInput input = new SyndFeedInput();
                SyndFeed feed = input.build(new XmlReader(stream));
                
                Feed feedModel = new Feed();
                
                feedModel.setUrl(url);
                feedModel.setTitle(feed.getTitle());
                feedModel.setDescription(feed.getDescription());
                
                SyndImage image = feed.getImage();
                if (image != null) {
                    feedModel.setImage(image.getUrl());
                }
                
                feedModel.setUpdated(new Date());
                feedModel.setCreated(feed.getPublishedDate());
                
                FeedController.createFeed(feedModel);
            }
        } catch (FeedException | IOException e) {
            return null;
        }
        return null;
    }
    
    

}
