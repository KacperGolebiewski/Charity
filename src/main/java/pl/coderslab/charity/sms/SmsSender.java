package pl.coderslab.charity.sms;

import pl.coderslab.charity.donation.Donation;

public interface SmsSender {

    void send(String to, Donation donation);
}
