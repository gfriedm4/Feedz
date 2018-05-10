package com.feedz.utils;

import com.feedz.controllers.FeedController;
import com.feedz.controllers.UserController;
import com.feedz.models.Feed;
import com.feedz.models.FeedUser;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.feed.synd.SyndFeedImpl;
import com.rometools.rome.feed.synd.SyndImage;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import com.feedz.models.User;
import java.util.Set;
import org.hibernate.HibernateException;

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
    
    public static SyndFeed getSyndFeed(Integer id) {
        ArrayList<Integer> ids = new ArrayList<>();
        ids.add(id);
        return getSyndFeed(ids);
    }
    
    public static SyndFeed getSyndFeed(ArrayList<Integer> feedIds) {
        
        List<Feed> feeds = FeedController.getFeeds(feedIds);
        
        SyndFeed toReturn = new SyndFeedImpl();
        List<SyndEntry> entries = new ArrayList<>();
        toReturn.setEntries(entries);
        try (CloseableHttpClient client = HttpClients.createMinimal()) {
            for (Feed feed : feeds) {
                HttpUriRequest request = new HttpGet(feed.getUrl());
                try (
                    CloseableHttpResponse response = client.execute(request);
                    InputStream stream = response.getEntity().getContent()
                ) {
                    SyndFeedInput input = new SyndFeedInput();
                    entries.addAll(input.build(new XmlReader(stream)).getEntries());
                }
            }
            return toReturn;
        } catch (FeedException | IOException | HibernateException e) {
            return toReturn;
        }
    }

}
