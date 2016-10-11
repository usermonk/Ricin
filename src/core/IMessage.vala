using Ricin;
using Ricin.Core;

namespace Ricin.Core {
  /**
  * @enum MessageKind - Defines the allowed message types.
  **/
  public enum MessageKind {
    Text, // A normal message
    Action, // An action message: /me
    Inline, // An inline media message: images, videos, web infos, music, etc...
    System // A system message: Status changes, key verification, etc...
  }

  /**
  * @interface IMessage - Defines an overall message.
  **/
  public interface IMessage : Object {
    /**
    * The message sender.
    **/
    public IPerson sender { get; private set; }

    /**
    * The message recipient.
    **/
    public IPerson recipient { get; private set; }

    /**
    * The message text.
    **/
    public string text { get; private set; }

    /**
    * The message type.
    **/
    public MessageKind kind { get; private set; default = MessageKind.Text; }

    /**
    * Has the message been received ?
    **/
    public bool received { get; set; default = false; }

    /**
    * The message sending timestamp.
    **/
    public DateTime sent_time { get; private set; }

    /**
    * The message receiving timestamp.
    **/
    public DateTime received_time { get; private set; }

    /**
    * Signal: Triggered once the message get mark as received by the recipient.
    * It is triggered by the read_receipt_callback from toxcore.
    * @param {DateTime} time - The time when the message got received.
    **/
    public signal void received (DateTime time);

    /**
    * This virtual allows to get a formated timestamp for the message.
    * @return {string} - Returns the formated timestamp.
    **/
    public virtual string get_formated_time ();
  }
}
