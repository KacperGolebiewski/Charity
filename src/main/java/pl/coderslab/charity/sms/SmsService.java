package pl.coderslab.charity.sms;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.donation.Donation;
import pl.smsapi.OAuthClient;
import pl.smsapi.api.SmsFactory;
import pl.smsapi.api.action.sms.SMSSend;
import pl.smsapi.api.response.MessageResponse;
import pl.smsapi.api.response.StatusResponse;
import pl.smsapi.exception.SmsapiException;
import pl.smsapi.proxy.ProxyNative;

import java.util.Optional;

@Service
@AllArgsConstructor
public class SmsService implements SmsSender {

    private final static String OAUTH_TOKEN = "SjH6xDH05oIXo4gF91b5GPifEZy00fe6dJE7UvTU";
    private final static String URL = "https://api.smsapi.pl/";
    private final static Logger LOGGER = LoggerFactory.getLogger(SmsSender.class);


    @Override
    public void send(String to, Donation donation) {
        try {

            OAuthClient client = new OAuthClient(OAUTH_TOKEN);
            ProxyNative proxy = new ProxyNative(URL);

            SmsFactory smsApi = new SmsFactory(client, proxy);

            SMSSend action = smsApi.actionSend()
                    .setTo(to)
                    .setText(messageBuilder(donation));

            StatusResponse result = action.execute();

            Optional<MessageResponse> status = result.getList().stream().findFirst();
            if (status.isEmpty()) {
                throw new RuntimeException();
            }
        } catch (SmsapiException e) {
            LOGGER.error("Exception: " + e.getMessage());
        }
    }

    private String messageBuilder(Donation donation) {
        return "Donation Summary:\n" +
                "You donate:\n" +
                donation.getQuantity() + " bags containing : " + donation.getCategories().toString() + "\n" +
                "For Institution:" + donation.getInstitution().getName() +
                "\nPickup Address:\n" +
                donation.getCity() + "\n" +
                donation.getStreet() + "\n" +
                donation.getZipCode() + "\n" +
                "Pick Up Date:\n" +
                donation.getPickUpDate() + "\n" +
                donation.getPickUpTime() + "\n" +
                "Pick comments:\n" +
                donation.getPickUpComment();
    }
}
